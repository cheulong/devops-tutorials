import subprocess

svc = "sshd"
check_cmd = ["ps", "-C", svc]

service_check = subprocess.call(check_cmd)

if service_check == 0:
    print("The service is running.")
else:
    print("The service is not running.")
    print("Starting the service...")
    subprocess.call(["systemctl", "start", svc])
    subprocess.call(check_cmd)