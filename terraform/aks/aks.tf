resource "kubernetes_deployment" "example" {
  metadata {
    name      = "{{.Values.deploy.name}}"
    namespace = "{{.Values.deploy.namespace}}"
  }

  spec {
    selector {
      match_labels = {
        app = "{{.Values.deploy.name}}"
      }
    }

    replicas = 1

    template {
      metadata {
        annotations = {
          buildNumber = "{{.Values.deploy.build | quote}}"
        }

        labels = {
          app = "{{.Values.deploy.name}}"
        }
      }

      spec {
        containers {
          name  = "{{.Values.deploy.name}}"
          image = "{{.Values.deploy.acrServer}}/{{.Values.deploy.name}}:{{.Values.deploy.imageTag}}"

          ports {
            name          = "http"
            container_port = 8080
          }

          resources {
            limits {
              memory = "460Mi"
              cpu    = "460m"
            }
            requests {
              memory = "460Mi"
              cpu    = "460m"
            }
          }
        }
        
        image_pull_secrets {
          name = "{{.Values.deploy.secretName}}"
        }
      }
    }
  }
}
