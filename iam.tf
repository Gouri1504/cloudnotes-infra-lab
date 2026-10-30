# Service account used by the CloudNotes application.
resource "google_service_account" "cloudnotes_app" {
  account_id   = "cloudnotes-app"
  display_name = "CloudNotes Application Service Account"
}

# Project-level role binding for the CloudNotes app service account.
resource "google_project_iam_member" "cloudnotes_app_role" {
  project = var.project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.cloudnotes_app.email}"
}
