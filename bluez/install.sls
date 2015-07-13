#!jinja|yaml

{% from "bluez/map.jinja" import datamap with context %}

bluez_install:
  pkg.installed:
    - pkgs: {{ datamap.lookup.pkgs }}

bluez_service:
  service:
    - {{ datamap.lookup.svc_state }}
    - name: {{ datamap.lookup.svc_name }}
    - enable: {{ datamap.lookup.svc_onboot }}
    - require:
      - pkg: bluez_install
    - watch:
      - pkg: bluez_install
