{{- define "wazuh.service" -}}
service:
  wazuh:
    enabled: true
    primary: true
    type: NodePort
    targetSelector: wazuh
    ports:
      webui:
        enabled: true
        primary: true
        port: {{ .Values.wazuhNetwork.webPort }}
        nodePort: {{ .Values.wazuhNetwork.webPort }}
        targetSelector: wazuh
{{- end -}}
