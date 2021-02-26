/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/2/26 20:11:32                           */
/*==============================================================*/


drop table if exists adm_menu;

drop table if exists adm_resource;

drop table if exists adm_resource_category;

drop table if exists adm_role;

drop table if exists adm_role_menu_relation;

drop table if exists adm_role_resource_relation;

drop table if exists adm_user;

drop table if exists adm_user_role_relation;

/*==============================================================*/
/* Table: adm_menu                                              */
/*==============================================================*/
create table adm_menu
(
   id                   bigint not null auto_increment comment 'ID',
   parent_id            bigint comment '父级ID',
   name                 varchar(100) comment '名称',
   icon                 varchar(200) comment '图标',
   level                int comment '级别',
   "order"              int comment '排序',
   update_time          datetime comment '更新时间',
   primary key (id)
);

/*==============================================================*/
/* Table: adm_resource                                          */
/*==============================================================*/
create table adm_resource
(
   id                   bigint not null comment 'ID',
   category_id          bigint comment '分类ID',
   name                 varchar(200) comment '资源名称',
   url                  varchar(200) comment '资源URL',
   description          varchar(500) comment '描述',
   create_time          datetime comment '创建时间',
   primary key (id)
);

/*==============================================================*/
/* Table: adm_resource_category                                 */
/*==============================================================*/
create table adm_resource_category
(
   id                   bigint not null comment 'ID',
   name                 varchar(200) comment '分类名称',
   "order"              int comment '排序',
   create_time          datetime comment '创建时间',
   primary key (id)
);

alter table adm_resource_category comment '资源分类表';

/*==============================================================*/
/* Table: adm_role                                              */
/*==============================================================*/
create table adm_role
(
   id                   bigint not null comment 'ID',
   name                 varchar(100) comment '名称',
   description          varchar(500) comment '描述',
   create_time          datetime comment '创建时间',
   status               tinyint(1) comment '状态[-1->停用，1->启用]',
   "order"              order comment '排序优先级',
   primary key (id)
);

alter table adm_role comment '后台用户角色表';

/*==============================================================*/
/* Table: adm_role_menu_relation                                */
/*==============================================================*/
create table adm_role_menu_relation
(
   id                   bigint not null comment 'ID',
   role_id              bigint comment '角色ID',
   menu_id              bigint comment '菜单ID',
   primary key (id)
);

/*==============================================================*/
/* Table: adm_role_resource_relation                            */
/*==============================================================*/
create table adm_role_resource_relation
(
   id                   bigint not null comment 'ID',
   role_id              bigint comment '角色ID',
   resource_id          bigint comment '资源ID',
   primary key (id)
);

alter table adm_role_resource_relation comment '角色资源关系表';

/*==============================================================*/
/* Table: adm_user                                              */
/*==============================================================*/
create table adm_user
(
   id                   bigint not null auto_increment comment 'ID',
   username             varchar(64) comment '用户名',
   password             varchar(64) comment '密码',
   realname             varchar(200) comment '真实姓名',
   email                varchar(100) comment '邮箱',
   icon                 varchar(500) comment '头像',
   phone                varchar(64) comment '电话',
   status               tinyint(1) comment '状态[-1->停用，1->启用]',
   primary key (id)
);

alter table adm_user comment '后台用户表';

/*==============================================================*/
/* Table: adm_user_role_relation                                */
/*==============================================================*/
create table adm_user_role_relation
(
   id                   bigint not null comment 'ID',
   user_id              bigint,
   role_id              bigint,
   primary key (id)
);

alter table adm_user_role_relation comment '后台用户角色关系表';

