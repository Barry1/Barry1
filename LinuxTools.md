# My Favourite Linux Things

## Packages

| packagename         | shot description                   |
| ------------------- | ---------------------------------- |
| [bashtop](#bashtop) | colorful top                       |
| apt-file            | matches files and packages         |
| chktex              | Finds typographic errors in LaTeX  |
| chrony              | NTP                                |
| conky-all           | highly configurable system monitor |
| gummi               | GTK+ latex editor                  |
| inxi                | system info                        |
| lacheck             | syntax checker for LaTeX           |
| lyx                 | WYSIWYG-frontend for LaTeX         |
| needrestart         | checks for needed restarts         |
| [nmap](#nmap)       | utility for network exploration    |
| pandoc              | general markup converter           |
| parallel            | easy parallel instead serial       |
| pssh                | parallel ssh execution of commands |

## Commands

| command      | package        | description                          |
| ------------ | -------------- | ------------------------------------ |
| niceload     | parallel       | slow down a program when the load average is above a certain limit|
| parallel-ssh | pssh           | same ssh command on multiple servers |
| ssh-copy-id  | openssh-client | installs login keys on server        |

## description and examples

### bashtop

[bashtop](https://github.com/aristocratos/bashtop) is a cool and colorful alternativ top the well known top command.

### nmap

An example command would be

```bash
nmap 192.168.177.1-254 -v -oA nmapscan
```

### parallel

[GNU parallel](https://www.gnu.org/software/parallel/) delivers some cool commands.
The main one is `parallel` for efficient parallel processing of commands.
It is also a good replacement for *for loops* in bash or so.
It also provides the cool command `niceload` which slows down a program if all systems load gets too high.
An example command would be

```bash
parallel --bar nice ffmpeg -i {} {.}.mp3 ::: *.webm *.mkv
```

for conversion of all \*.webm and \*.mkv files to *.mp3

### powertop

[PowerTOP](https://01.org/powertop/) reports which omponents in the system are most likely to blame for higher-than-needed power consumption, ranging from software applications to active components in the system.
Detailed screens are  available for CPU C and P states, device activity, and software activity.
