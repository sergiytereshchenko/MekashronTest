﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MekashronTest.DBModel
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class mekashrontvEntities : DbContext
    {
        public mekashrontvEntities()
            : base("name=mekashrontvEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<actionfire> actionfire { get; set; }
        public DbSet<business> business { get; set; }
        public DbSet<calendars> calendars { get; set; }
        public DbSet<categories> categories { get; set; }
        public DbSet<cati> cati { get; set; }
        public DbSet<cati_fields> cati_fields { get; set; }
        public DbSet<cati_fields_action> cati_fields_action { get; set; }
        public DbSet<countries> countries { get; set; }
        public DbSet<currency> currency { get; set; }
        public DbSet<customfields> customfields { get; set; }
        public DbSet<customfields_action> customfields_action { get; set; }
        public DbSet<customfields_box> customfields_box { get; set; }
        public DbSet<customfields_plates> customfields_plates { get; set; }
        public DbSet<customlistbox> customlistbox { get; set; }
        public DbSet<customtable11> customtable11 { get; set; }
        public DbSet<customtable133> customtable133 { get; set; }
        public DbSet<customtable27> customtable27 { get; set; }
        public DbSet<customtable32> customtable32 { get; set; }
        public DbSet<customtable5> customtable5 { get; set; }
        public DbSet<customtable608> customtable608 { get; set; }
        public DbSet<customtable68> customtable68 { get; set; }
        public DbSet<entities> entities { get; set; }
        public DbSet<entities_events> entities_events { get; set; }
        public DbSet<entities_files> entities_files { get; set; }
        public DbSet<historydata> historydata { get; set; }
        public DbSet<inbox> inbox { get; set; }
        public DbSet<incoming> incoming { get; set; }
        public DbSet<location> location { get; set; }
        public DbSet<messages> messages { get; set; }
        public DbSet<orders> orders { get; set; }
        public DbSet<orders_documents> orders_documents { get; set; }
        public DbSet<orders_events> orders_events { get; set; }
        public DbSet<orders_payment> orders_payment { get; set; }
        public DbSet<orders_products> orders_products { get; set; }
        public DbSet<orders_products_purchase> orders_products_purchase { get; set; }
        public DbSet<outgoing> outgoing { get; set; }
        public DbSet<payments> payments { get; set; }
        public DbSet<permissionsgroup> permissionsgroup { get; set; }
        public DbSet<printersset> printersset { get; set; }
        public DbSet<products> products { get; set; }
        public DbSet<products_rent> products_rent { get; set; }
        public DbSet<products_stock> products_stock { get; set; }
        public DbSet<purchase> purchase { get; set; }
        public DbSet<purchase_payment> purchase_payment { get; set; }
        public DbSet<purchase_products> purchase_products { get; set; }
        public DbSet<reports_set> reports_set { get; set; }
        public DbSet<service> service { get; set; }
        public DbSet<service_task> service_task { get; set; }
        public DbSet<service_task_history> service_task_history { get; set; }
        public DbSet<sipextensions> sipextensions { get; set; }
        public DbSet<spooler> spooler { get; set; }
        public DbSet<stations> stations { get; set; }
        public DbSet<system_parameters> system_parameters { get; set; }
        public DbSet<systemlog> systemlog { get; set; }
        public DbSet<telemarketing> telemarketing { get; set; }
        public DbSet<telemarketing_history> telemarketing_history { get; set; }
        public DbSet<telemarketing_phone_script> telemarketing_phone_script { get; set; }
        public DbSet<telemarketing_shift> telemarketing_shift { get; set; }
        public DbSet<telemarketing_status> telemarketing_status { get; set; }
        public DbSet<telemarketing_tracking> telemarketing_tracking { get; set; }
        public DbSet<textdata> textdata { get; set; }
        public DbSet<tickets> tickets { get; set; }
        public DbSet<users> users { get; set; }
        public DbSet<users_group> users_group { get; set; }
        public DbSet<users_messager> users_messager { get; set; }
        public DbSet<users_payroll> users_payroll { get; set; }
        public DbSet<users_permissions> users_permissions { get; set; }
        public DbSet<users_shift> users_shift { get; set; }
        public DbSet<users_visible_fields> users_visible_fields { get; set; }
        public DbSet<eventlog> eventlog { get; set; }
    }
}