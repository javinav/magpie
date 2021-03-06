*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de


$setglobal c70_feed_scen  ssp2
*   options:    ssp1,ssp2,ssp3,ssp4,ssp5,constant

table f70_feed_baskets(t_all,i,kap,kall,feed_scen70) feed baskets (t DM per t DM livestock product)
$ondelim
$include "./modules/70_livestock/fbask_jan16/input/f70_feed_baskets.cs3"
$offdelim;

table f70_feed_balanceflow(t_all,i,kap,kall) Balanceflow in mio ton DM to balance difference between estimated feed baskets and FAO
$ondelim
$include "./modules/70_livestock/fbask_jan16/input/f70_feed_balanceflow.cs3"
$offdelim;

table f70_livestock_productivity(t_all,i,sys,feed_scen70) Productivity indicator for livestock production (t FM per animal)
$ondelim
$include "./modules/70_livestock/fbask_jan16/input/f70_livestock_productivity.cs3"
$offdelim;

table f70_cost_regr(kap,cost_regr) factor requirements livestock (US$04 per ton DM (A) and US$ (B))
$ondelim
$include "./modules/70_livestock/fbask_jan16/input/f70_capit_liv_regr.csv"
$offdelim
;

parameter f70_slaughter_feed_share(t_all,i,kap,attributes,feed_scen70) share of feed that is incorprated in animal biomass (1)
/
$ondelim
$include "./modules/70_livestock/fbask_jan16/input/f70_slaughter_feed_share.cs4"
$offdelim
/
;
