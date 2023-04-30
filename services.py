#!/usr/bin/env python3
import os
import yaml
from typing import Optional
from cereal import CEREAL_PATH

RESERVED_PORT = 8022  # sshd
STARTING_PORT = 5100


def new_port(port: int):
  port += STARTING_PORT
  return port + 1 if port >= RESERVED_PORT else port


class Service:
  def __init__(self, port: int, vals):
    self.port = port
    self.should_log = vals["log"]
    self.frequency = vals.get("frequency", 0.0)
    self.decimation = vals.get("decimation", None)
    self.keep_last = vals.get("keepLast", True)

with open(os.path.join(CEREAL_PATH, "resources/services.yaml"), 'r') as stream:
    services = yaml.safe_load(stream)["services"]

service_list = {name: Service(new_port(idx), vals) for  # type: ignore
                idx, (name, vals) in enumerate(services.items())}


def build_header():
  h = ""
  h += "/* THIS IS AN AUTOGENERATED FILE, PLEASE EDIT services.yaml */\n"
  h += "#ifndef __SERVICES_H\n"
  h += "#define __SERVICES_H\n"
  h += "struct service { char name[0x100]; int port; bool should_log; int frequency; int decimation; bool keep_last; };\n"
  h += "static struct service services[] = {\n"
  for k, v in service_list.items():
    should_log = "true" if v.should_log else "false"
    keep_last = "true" if v.keep_last else "false"
    decimation = -1 if v.decimation is None else v.decimation
    h += '  { "%s", %d, %s, %d, %d, %s },\n' % \
         (k, v.port, should_log, v.frequency, decimation, keep_last)
  h += "};\n"
  h += "#endif\n"
  return h


if __name__ == "__main__":
  print(build_header())
