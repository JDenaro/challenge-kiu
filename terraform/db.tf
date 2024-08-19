module "aurora" {
  source = "terraform-aws-modules/rds-aurora/aws"

  name            = "kiu-postgresql"
  engine          = "aurora-postgresql"
  engine_version  = "15.4"
  instance_class  = "db.t3.medium"
  instances       = { 1 = {} }
  master_username = "root"
  database_name   = "kiudb"

  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.database_subnet_group_name
  security_group_rules = {
    # vpc_ingress = {
    #   cidr_blocks = module.vpc.private_subnets_cidr_blocks
    # }
    eks_ingress = {
      source_security_group_id = module.eks.node_security_group_id
    }
  }

  autoscaling_enabled      = true
  autoscaling_min_capacity = 1
  autoscaling_max_capacity = 5

  monitoring_interval           = 60
  iam_role_name                 = "kiu-monitor"
  iam_role_use_name_prefix      = true
  iam_role_description          = "kiu RDS enhanced monitoring IAM role"
  iam_role_path                 = "/autoscaling/"
  iam_role_max_session_duration = 7200

  apply_immediately   = true
  skip_final_snapshot = true

  enabled_cloudwatch_logs_exports = ["postgresql"]

  #tags = local.tags
}
