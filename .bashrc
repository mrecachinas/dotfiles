LEJOS_NXT_JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
NXJ_HOME=/home/michaelrecachinas1/lejos_cs3240/leJOS_NXJ
PATH=/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/usr/texbin:/Users/michaelrecachinas/.rvm/bin:/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home/bin:/Users/michaelrecachinas1/lejos_nxj/bin:/home/michaelrecachinas1/lejos_cs3240/leJOS_NXJ/bin

cdls(){
if[ -z "$1" ]; then
    cd && ls
else
    cd "$*" && ls
fi
}
alias cd=cdls
