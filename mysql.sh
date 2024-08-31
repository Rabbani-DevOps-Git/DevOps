userid=$(id -u)
R="\e[31m"
W="\e[0m"

validate(){
	if [ $1 -ne 0 ]
	then
		echo "Package $2 is not installed"
	else
		echo -e "package $R $2 $W already $R installed "
		exit 1
	fi
}

if [ $userid -eq 0 ]
then
	echo "user id is $userid"
	echo "package validation initiated"
	dnf list installed mysql &>> /dev/null
	validate $? mysql
	if [ $? -eq 0 ]
	then
		dnf install mysql -y
	else
		validate $? mysql
	fi

else
	echo "please run the script with root user"
	exit 1
fi

