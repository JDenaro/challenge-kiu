# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "EKS_cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "EKS_cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "EKS_cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}


