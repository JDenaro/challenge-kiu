# Kiu DevOps Challenge

This repository contains my solution to the Kiu DevOps challenge.

## Infrastructure

- **Cloud Provider:** AWS
- **Tools Used:** Terraform, Helm
- **Main Components:**
  - EKS
  - RDS
  - Secrets Manager
  - ELB

### Prerequisites

- AWS CLI
- Kubectl
- Terraform
- Helm

### Deployment

1. Clone the repository:
    ```bash
    git clone https://github.com/JDenaro/challenge-kiu.git
2. Run terraform:
    ```bash
    go to ./terraform and run "terraform apply --auto-approve"
3. Update kubeconfig:
    ```bash
    run "aws eks update-kubeconfig --name kiu-eks"
4. Manually create Kubernetes DB secret:
    ```bash
    kubectl create secret generic kiu-app-db-secret \
      --from-literal=DB_HOST=example.cluster-c1wa6eaumkjz.us-east-1.rds.amazonaws.com \
      --from-literal=DB_USERNAME=root \
      --from-literal=DB_NAME=kiudb \
      --from-literal=DB_PASSWORD=password123 \
5. Deploy Helm chart:
    ```bash
    go to ./helm and run "helm install kiu-app ."
6. Get Load Balancer DNS name:
    ```bash
    kubectl get service <service-name> -n <namespace> -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
## Supporting documentation

https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks

https://github.com/terraform-aws-modules/terraform-aws-eks

https://github.com/terraform-aws-modules/terraform-aws-rds-aurora

https://github.com/terraform-aws-modules/terraform-aws-vpc