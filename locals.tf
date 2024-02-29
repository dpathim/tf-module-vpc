locals {

  #subnets
  public_subnet_ids = [for k,v in lookup(lookup(module.subnets, "public", null), "subnet_ids", null) : v.id]
  app_subnet_ids = [for k,v in lookup(lookup(module.subnets, "app", null), "subnet_ids", null) : v.id]
  db_subnet_ids = [for k,v in lookup(lookup(module.subnets, "db", null), "subnet_ids", null) : v.id]
  private_subnet_ids = concat(local.app_subnet_ids, local.db_subnet_ids)

  #RT
  public_rout_table_ids = [for k,v in lookup(lookup(module.subnets, "public", null), "route_table_ids", null) : v.id]
  app_rout_table_ids = [for k,v in lookup(lookup(module.subnets, "app", null), "aws_route_table", null) : v.id]
  db_rout_table_ids = [for k,v in lookup(lookup(module.subnets, "db", null), "aws_route_table", null) : v.id]
  private_rout_table_ids = concat(local.app_rout_table_ids, local.db_rout_table_ids)

  # Tags
  tags = merge(var.tags, {tf-module-name ="vpc"} ,{env = var.env})

}


