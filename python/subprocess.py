import subprocess

svc = "sshd"
check_cmd = ["ps", "-C", svc]

service_check = subprocess.call(check_cmd)

if service_check == 0:
    print("The service is running.")
else:
    print("The service is not running.")
    print("Starting the service...")
    try:
        subprocess.check_output(["systemctl", "start", svc])
    except subprocess.CalledProcessError as e:
        print("Error starting the service")
        print(e)
        exit(1)
    subprocess.call(check_cmd)