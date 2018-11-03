https://enigma0x3.net/2016/01/28/an-empire-case-study/
Red Teamer and Security Addict
This post is part of the ‘Empire Series’, with some background and an ongoing list of series posts [kept here]. 

-Elevation
-not_elevated
-initial_local_admin
-bypass_uac
-Gathering Credentials
-creds
-creds_filtered
-usemodule situational_awareness/network/powerview/get_user.
-get_user_setu
-get_user_output
If you use PowerView for normal situational awareness you may see that the output for this module looks much like the output of the Get-NetUser function in PowerView. 
Hunting
situational_awareness/network/powerview/user_hunter module. This module takes the Invoke-UserHunter function from PowerView and abstracts it into its own module within Empire.
user_hunter

It looks like the Domain Admin “DEV\will-da” has a session from 192.168.99.136. Let’s see if Mike’s compromised credentials will get us access to that host. We can get the hostname of this target with Empire’s shell command:
host_resolve

Now we can check and see what users/groups are a part of the local administrators group on that host by running the situational_awareness/network/powerview/get_localgroup module. This particular module is an abstracted version of Get-NetLocalGroup from PowerView.
localgroup_setup

The output from this module will let us know exactly who can access the host we’re targeting:

localgroup_execute

In the output above we can see that the group “Workstation Admins” is one of the groups added to the local administrators group on our target. Since we also set the -Recurse flag the backend PowerView code resolved the members of any resulting groups as well, giving us the effective set of users who can access the host. With this output we can verify that Mike’s credentials will give us access to our target host.
Lateral Movement

Since we now know that “Mike” should give us access to the host with the Domain Admin “will-da” logged in, let’s verify the access by stealing one of Mike’s process tokens and trying to access the host remotely. Since we saw that Mike had a process of “cmd” running, we can filter the ps output for just those processes with ps cmd.

filtered_ps

We can steal its token by using the steal_token <PID> command and then attempt to access “C$” of the target host:

steal_token

Now that we’ve confirmed access, let’s trigger an agent on the remote system. Empire has a variety of lateral movement options, but for this case study we’ll stick to WMI. Let’s load it up with usemodule lateral_movement/invoke_wmi:

WMI_SETUP

After setting the Listener and the ComputerName fields we can kick off execution. In situations where you can’t get into the context of a user that has access to a target, but you have their credentials, you can set the CredID field to the entry that corresponds to that particular credential set.

wmi_execute

Success, we have a new agent! Let’s pillage this new host with mimikatz:

da_credentials

W00t, we now have plaintext domain administrator credentials!

 

It is important to note that after moving laterally via WMI you will face something called the “double-hop problem”, meaning your new agent context can’t be used to jump to additional machines. We can resolve this by injecting into another process or stealing the token of another user. In our case we can easily inject into a process by using the management/psinject module. Let’s find a process owned by “will-da”:

will-da_processes

The psinject module has 2 required arguments- the listener you want the new agent to stage from and the PID of the process you wish to inject into.

will-da_inject

With an agent running in the context of the domain admin in dev.lab.local we can verify our access by executing a shell dir on C$ of a domain controller. First let’s identify the domain controllers for our current domain with the situational_awareness/network/powerview/get_domain_controller module:

domain_controller

Now let’s verify the access:

dev_dc_access
Hopping the Trust

Domain Admin credentials for DEV are fun and all, but what we really want is Enterprise Admin access in the parent lab.local domain. To verify that the dev->lab trust relationship exists, let’s first use the situational_awareness/network/powerview/get_domain_trust module:

domain_trust

The output confirms that there is a Bidirectional trust between dev.lab.local and its parent lab.local. Since this is a forest trust we can leverage our DA credentials in the child to compromise the entire forest! But before we do, we need a few pieces of information.

First we need to get the SID of the parent domain by resolving the LAB\krbtgt account to its security identifier with the management/user_to_sid module:

parent_user_to_sid

Next, we need to get the hash of the krbtgt account for the dev.lab.local child domain. Benjamin Delpy and Vincent Le Toux have us covered with Mimikatz’ DCSync functionality, which is implemented in Empire’s credentials/mimikatz/dcsync module. All we need to do is fill in the UserName option:

dev_krbtgt

Empire nicely parsed the output for us and threw it into the credential store:

dev_krbtgt_credstore

We now have all the information we need to execute the external SID history Golden Ticket attack which will allow us to compromise the root of the forest. Empire implements Mimikatz’ Golden Ticket functionality in credentials/mimikatz/golden_ticket. Since the hash of DEV\krbtgt was scraped and thrown into the credential store we can simply enter the credential ID in the CredID field within the Golden Ticket module. Then all we need to do is specify a user and an external SID for the ticket. When specifying the SID, we need to take the “502” off the end and add a “519” to construct the full SID of lab.local\Enterprise Admins.

golden_ticket

With the ticket created, we can now use DCSync to extract the krbtgt hash of the parent lab.local domain:

lab_local_krbtgt

Now we have both hashes of the krbtgt accounts for both domains:

all_krbtgt

It’s not really necessary, but let’s go ahead and repeat the Golden Ticket process with the krbtgt hash of lab.local. We just have to specify the CredID for the lab.local krbtgt account, the username and the domain (lab.local) since the module remembers the sid options:

final_golden_ticket_setup

final_golden_ticket

As you can see above, we were able to successfully create another Golden ticket using the krbtgt from the parent (lab.local) domain.

Just to make sure everything went smoothly, we can test access to the lab.local Domain Controller by hitting C$:

lab_dc_access

Hopefully this post showed you how Empire can help execute a complete engagement from initial access to complete forest compromise. Stay tuned for additional posts in the “Empire Series” where we’ll dive into more of Empire’s functionality!
Share this:

    TwitterFacebook4Google

Related

Phishing with EmpireWith 5 comments

Empire Tips and TricksWith 16 comments

Lateral Movement using Excel.Application and DCOM
Bookmark the permalink.
One thought on “An Empire Case Study”

    Pingback: Offensive Tools and Techniques | Count Upon Security

Leave a Reply
Search for:
Recent Posts

    CVE-2018–8414: A Case Study in Responsible Disclosure
    CVE-2018-8212: Device Guard/CLM bypass using MSFT_ScriptResource
    The Tale of SettingContent-ms Files
    Reviving DDE: Using OneNote and Excel for Code Execution
    Lateral Movement Using Outlook’s CreateObject Method and DotNetToJScript

Recent Comments
	Soc on Defeating Device Guard: A look…
	“Fileless… on “Fileless” UAC Byp…
	“Fileless… on Bypassing UAC using App P…
	Windows 10 UAC Looph… on Bypassing UAC using App P…
	NexusLogger: A New C… on “Fileless” UAC Byp…
Archives

    October 2018
    June 2018
    January 2018
    November 2017
    October 2017
    September 2017
    August 2017
    July 2017
    April 2017
    March 2017
    January 2017
    November 2016
    August 2016
    July 2016
    May 2016
    March 2016
    February 2016
    January 2016
    October 2015
    August 2015
    April 2015
    March 2015
    January 2015
    October 2014
    July 2014
    June 2014
    March 2014
    January 2014

Categories

    Uncategorized

Meta

    Register
    Log in
    Entries RSS
    Comments RSS
    WordPress.com

Blog at WordPress.com.
:)
