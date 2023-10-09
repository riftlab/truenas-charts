{{- define "drawio.workload" -}}
workload:
  drawio:
    enabled: true
    primary: true
    type: Deployment
    podSpec:
      hostNetwork: {{ .Values.drawioNetwork.hostNetwork }}
      containers:
        drawio:
          enabled: true
          primary: true
          imageSelector: image
          securityContext:
            runAsUser: {{ .Values.drawioRunAs.user }}
            runAsGroup: {{ .Values.drawioRunAs.group }}
            readOnlyRootFilesystem: false
          {{ with .Values.drawioConfig.additionalEnvs }}
          envList:
            {{ range $env := . }}
            - name: {{ $env.name }}
              value: {{ $env.value }}
            {{ end }}
          {{ end }}
          probes:
            liveness:
              enabled: true
              type: http
              port: 8080
              path: /
            readiness:
              enabled: true
              type: http
              port: 8080
              path: /
            startup:
              enabled: true
              type: http
              port: 8080
              path: /
{{- end -}}
