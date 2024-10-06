import subprocess
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("appid")
args = parser.parse_args()

app_list = str(subprocess.check_output(["lswt"]))
already_open = args.appid in app_list

if already_open:
    quit()

subprocess.Popen(["kitty", "--class", args.appid, "-e", args.appid])
