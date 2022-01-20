uname="$(uname -s)"

case "${uname}" in
    Linux*)  machine=linux;;
    Darwin*) machine=macosx;;
    CYGWIN*) machine=windows;;
    MINGW*)  machine=windows;;

    *)
        machine="UNKNOWN:${uname}"
        echo "Cannot install for ${machine}"
        exit
        ;;

esac

#echo "Detected OS ${machine}"

case "${machine}" in

"windows")
    start bin/win-x32/inspector.exe
    start bin/win-x32/scapp.exe main.htm --debug
    ;;

"linux")
    bin/linux/inspector &
    bin/linux/scapp main.htm --debug &
    ;;

"macosx")
    # open inspector
    open -a inspector.app

    # open scapp application in debug mode
    bin/macosx/scapp main.htm --debug &
    ;;

esac
