resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  maintenance_policy {
    recurring_window {
      window {
        days_of_week = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        start_time    = "00:00"
        end_time      = "23:59"
      }
    }
  }

  network    = "default"
  subnetwork = "default"
}
