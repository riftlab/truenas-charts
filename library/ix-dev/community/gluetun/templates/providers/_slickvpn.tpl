{{/* https://github.com/qdm12/gluetun/wiki/SlickVPN */}}
{{- define "gluetun.slickvpn.openvpn.validation" -}}
  {{/* Cert and Key Required */}}
  {{- if eq .Values.gluetunConfig.openvpnCertKeyMethod "file" -}}
    {{- include "gluetun.options.required" (dict "rootCtx" $
                                                  "options" (list
                                                            "openvpnCertHostPath"
                                                            "openvpnKeyHostPath")) -}}
  {{- else if eq .Values.gluetunConfig.openvpnCertKeyMethod "content" -}}
    {{- include "gluetun.options.required" (dict "rootCtx" $
                                                  "options" (list
                                                            "openvpnCert"
                                                            "openvpnKey")) -}}
  {{- else -}}
    {{- include "gluetun.certkey.required.error" $ -}}
  {{- end -}}
  {{/* Required */}}
  {{- include "gluetun.options.required" (dict "rootCtx" $
                                                "options" (list
                                                          "openvpnUser"
                                                          "openvpnPassword")) -}}
  {{/* Unsupported */}}
  {{- include "gluetun.unsupported.server.options" (dict "rootCtx" $
                                                          "options" (list
                                                                    "serverNames")) -}}
{{- end -}}

{{- define "gluetun.slickvpn.wireguard.validation" -}}
  {{- include "gluetun.unsupported.type" $ -}}
{{- end -}}