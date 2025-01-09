from linode_api4 import LinodeClient

client = LinodeClient('YOUR_API_KEY')

available_regions = client.regions()

chosen_region = available_regions[3]

new_linode, password = client.linode.instance_create(
    "g6-standard-2",
    region=chosen_region,
    label="My Linode",
    image="linode/ubuntu20.04lts",
)

print("ssh root@{} - {}".format(new_linode.ipv4[0], password))