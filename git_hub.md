---
title: My Experiences and Ideas around git and github
author: Dr. Bastian Ebeling
date: 29. Juli 2024
---

## act - running github-workflows locally

From the [Repository](https://github.com/nektos/act) there is the so called tool `act` which uses docker to run github workflows locally.

For more details read the doc.  
For quick start I propose to run

```sh
curl --proto '=https' --tlsv1.2 -sSf  https://raw.githubusercontent.com/nektos/act/master/install.sh | bash -s -- -b ~/.local/bin
```

which will install the latest revision into your `~/local/bin/` path.
I do prefer that instead of the details within [Install hints](https://nektosact.com/installation/index.html) which uses `sudo` and does not define the path.

Then from within any (local) github repo try these commands

- `act workflow_dispatch --list` to show all actions for the event `workflows_dispatch`
- `act -j test --list` to show all events for the job `test`

and play around with it.
