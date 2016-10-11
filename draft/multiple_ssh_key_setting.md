~/.ssh/config alias
gitDir/.git/config

change 

# ~/.ssh/config
Host work
  HostName bitbucket.org
  IdentityFile ~/.ssh/work

Host personal
  HostName bitbucket.org
  IdentityFile ~/.ssh/personal
And then in my project's local git config, I changed the host part of the remote URL to the appropriate host. For example, in the following file:

# ~/repos/myworkproject/.git/config
# or you can access this file by going into the repo and running `git config -e`
...snip...
[remote "origin"]
  fetch = ...
  url = git@bitbucket.org:mybitbucketusername/myworkproject.git
Change the url line to:

url = git@work:mybitbucketusername/myworkproject.git
