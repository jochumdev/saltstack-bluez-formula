#!jinja|yaml

include:
  - bluez.install

{% from "bluez/map.jinja" import datamap with context %}

{% for k, v in salt['pillar.get']('bluez:configs', {})|dictsort %}
bluez_config_{{ k }}:
  file:
    - managed
    - name: {{ datamap.lookup.config_directory }}/{{ k }}
    - contents_pillar: bluez:configs:{{ k }}:content
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: bluez_install
    - require_in:
      - service: bluez_service
    - watch_in:
      - service: bluez_service
{% endfor %}
