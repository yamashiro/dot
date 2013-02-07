function up()
{
    to=$(perl -le '$p=$ENV{PWD}."/";$d="/".$ARGV[0]."/";$r=rindex($p,$d);\
                   $r>=0 && print substr($p, 0, $r+length($d))' $1)
    if [ "$to" = "" ]; then
        echo "no such file or directory: $1" 1>&2
        return 1
    fi
    cd $to
}