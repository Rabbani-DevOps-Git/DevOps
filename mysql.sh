userid=$(id -u)


validate(){
	if [ $1 -ne 0 ]
	then
		echo "Package is not installed"
	else
		echo "package already installed"
		exit 1
	fi
}

if [ $userid -eq 0 ]
then
	echo "user id is $userid"
	echo "package validation initiated"
	dnf list installed mysql &>> /dev/null
	validate $?
	if [ $? -eq 0 ]
	then
		dnf install mysql -y
	else
		validate $?
	fi

else
	echo "please run the script with root user"
	exit 1
fi

