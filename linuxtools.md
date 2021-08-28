# My Favourite Linux Things

## Packages

| packagename | short description |
| :--- | :--- |
| apt-file | matches files and packages |
| [bashtop](linuxtools.md#bashtop) | colorful top |
| bc | An arbitrary precision calculator language |
| chktex | Finds typographic errors in LaTeX |
| chrony | NTP |
| conky-all | highly configurable system monitor |
| exif | command-line utility to show EXIF information in JPEG files |
| \[exiftool\(\#exiftool\)\] | virtual alias for `libimage-exiftool-perl` |
| exiv2 | EXIF/IPTC/XMP metadata manipulation tool |
| gummi | GTK+ latex editor |
| htop | Htop is an ncursed-based process viewer similar to top |
| inxi | system info |
| jhead | manipulate the non-image part of Exif compliant JPEG files |
| lacheck | syntax checker for LaTeX |
| lyx | WYSIWYG-frontend for LaTeX |
| needrestart | checks for needed restarts |
| [nmap](linuxtools.md#nmap) | utility for network exploration |
| pandoc | general markup converter |
| [parallel](linuxtools.md#parallel) | easy parallel instead of serial |
| [powertop](linuxtools.md#powertop) | diagnose issues with power consumption and management |
| pssh | parallel ssh execution of commands on multiple nodes |
| rubber | automated system for building LaTeX documents |
| schedtool | Queries/alters process' scheduling policy and CPU affinity |
| texlive-lang-german | features for german language - babel and so on |
| [tldr](linuxtools.md#tldr) | easier man pages with examples |

## Commands

| command | package | description |
| :--- | :--- | :--- |
| arch | coreutils | Print machine architecture |
| niceload | parallel | slow down a program when the load average is above a certain limit |
| parallel-ssh | pssh | same ssh command on multiple servers |
| ssh-copy-id | openssh-client | installs login keys on server |

## description and examples

### bashtop

[bashtop](https://github.com/aristocratos/bashtop) is a cool and colorful alternativ top the well known top command.

### nmap

An example command would be

```bash
nmap 192.168.177.1-254 -v -oA nmapscan
```

### parallel

[GNU parallel](https://www.gnu.org/software/parallel/) delivers some cool commands. The main one is `parallel` for efficient parallel processing of commands. It is also a good replacement for _for loops_ in bash or so. It also provides the cool command `niceload` which slows down a program if all systems load gets too high. An example command would be

```bash
parallel --bar nice ffmpeg -i {} {.}.mp3 ::: *.webm *.mkv
```

for conversion of all \*.webm and \*.mkv files to \*.mp3

### powertop

[PowerTOP](https://01.org/powertop/) reports which omponents in the system are most likely to blame for higher-than-needed power consumption, ranging from software applications to active components in the system. Detailed screens are available for CPU C and P states, device activity, and software activity.

### tldr

[tldr](https://tldr.sh/) The TLDR pages are a community effort to simplify the beloved man pages with practical examples.

### exiftool

library and program to read and write meta information in multimedia files Image::ExifTool is a customizable set of Perl modules plus a full-featured command-line application called exiftool for reading and writing meta information in a wide variety of files, including the maker note information of many digital cameras by various manufacturers such as Canon, Casio, DJI, FLIR, FujiFilm, GE, GoPro, HP, JVC/Victor, Kodak, Leaf, Minolta/Konica-Minolta, Nikon, Nintendo, Olympus/Epson, Panasonic/Leica, Pentax/Asahi, Phase One, Reconyx, Ricoh, Samsung, Sanyo, Sigma/Foveon and Sony.

Examples

```bash
exiftool '-Directory<DateTimeOriginal' -d %Y/%m/%d dir
```

Move all files in "dir" into a directory hierarchy based on year, month and day of "DateTimeOriginal". This command would move the file "dir/image.jpg" with a "DateTimeOriginal" of "2005:10:12 16:05:56" to "2005/10/12/image.jpg".

```bash
exiftool -p '$filename has date $dateTimeOriginal' -q -f dir
```

Print one line of output containing the file name and DateTimeOriginal for each image in directory "dir".

```bash
exiftool -d '%r %a, %B %e, %Y' -DateTimeOriginal -S -s *.jpg
```

Print formatted date/time for all JPG files in the current directory.

Many more interesting examples could be found in the [man-pages](https://linux.die.net/man/1/exiftool#:~:text=Reading%20Examples).

