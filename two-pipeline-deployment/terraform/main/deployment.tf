data "kubectl_file_documents" "deployment-app" {
  content = file("#{file}#")
}

resource "kubectl_manifest" "deployment" {
  count     = length(data.kubectl_file_documents.deployment-app.documents)
  yaml_body = element(data.kubectl_file_documents.deployment-app.documents, count.index)
}