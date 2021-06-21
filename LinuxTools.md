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
| pandoc              | general markup converter           |

## Commands

| command     | package        | description                   |
| ----------- | -------------- | ----------------------------- |
| ssh-copy-id | openssh-client | installs login keys on server |

## description and examples

### bashtop

[bashtop](https://github.com/aristocratos/bashtop) is a cool and colorful alternativ top the well known top command.

### parallel

[GNU parallel](https://www.gnu.org/software/parallel/) delivers some cool commands.
The main one is `parallel` for efficient parallel processing of commands.
It is also a good replacement for *for loops* in bash or so.
It also provides the cool command `niceload` which slows down a program if all systems load gets too high.
An example command would be

```bash
parallel --bar nice ffmpeg -i {} {.}.mp3 ::: *.webm *.mkv
```

for conversion of all *.webm and *.mkv files to *.mp3

### powertop

[PowerTOP](https://01.org/powertop/) reports which omponents in the system are most likely to blame for higher-than-needed power consumption, ranging from software applications to active components in the system.
Detailed screens are  available for CPU C and P states, device activity, and software activity.
