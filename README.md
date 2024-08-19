# Kiu DevOps Challenge

This repository contains my solution to the Kiu DevOps challenge.

## Task
 Your company is launching a new product, and you are responsible for deploying and
 managing the infrastructure. You need to create a Kubernetes cluster to run the
 application, use Terraform to automate the creation of the necessary cloud resources, and
 deploy a database to store data generated by the application.
### Requirements
- The application should be accessible via a publicly accessible domain.
- The application should use a database to store data generated by the application.
- The database should be scalable and able to handle a large number of concurrent
users.
- The infrastructure should be secure and follow best practices.
### Instructions
- Use Terraform to create the necessary cloud resources (e.g., VMs, load balancers, databases) to run the application and the database.
- Deploy the application to the Kubernetes cluster.
- Deploy the database to the infrastructure and configure it for high availability and scalability.
- Ensure that the application is accessible via a publicly accessible domain.
- Scale the application and the database to handle a large number of concurrent users.
- Secure the infrastructure and follow best practices.
### Submission
Please submit your Terraform and Kubernetes configuration files, along with a README explaining your architecture choices and how you ensured the infrastructure is secure.
Additionally, please include the scripts or commands used to deploy and configure the database.
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
## Security
- EKS API is only reacheable from within VPC
- Aurora Postgres instance is only reacheable from EKS node group security group (SG)
- Database credentials are stored in AWS Secrets Manager
## Supporting documentation

https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks

https://github.com/terraform-aws-modules/terraform-aws-eks

https://github.com/terraform-aws-modules/terraform-aws-rds-aurora

https://github.com/terraform-aws-modules/terraform-aws-vpc