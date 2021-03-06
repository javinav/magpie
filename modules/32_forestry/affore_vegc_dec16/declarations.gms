*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de

scalars
 s32_shift                 Number of 5-year age-classes corresponding to current time step length (1)
;

parameters
 p32_carbon_density(t,j,land32,c_pools) Carbon density for land32 and c_pools (tC per ha)
 p32_land(t,j,ac,when)                  Forestry land for each cell wood type and age class before and after optimization (mio. ha)
 pc32_land(j,land32)                    Forestry land per forestry land type initialization of the optimization (mio. ha)
 p32_aff_pot(t,j)                       Potential afforestation area (mio. ha)
 p32_aff_pol_timestep(t,j)			    NDC afforestation per time step (mio. ha)
 p32_aff_pol(t,j)			            NDC cumulative afforestion target (mio. ha)
 p32_aff_togo(t)              			Remaining NDC afforestation wrt to the max NDC target over time (Mha)
;

positive variables
 vm_cost_fore(i)                        Afforestation costs (mio. USD)
 v32_land(j,land32)                     Forestry land pools (mio. ha)
 vm_landdiff_forestry                   Aggregated difference in forestry land compared to previous timestep (mio. ha)
 v32_land_expansion(j,land32) 			Forestry land expansion compared to previous timestep (mio. ha)
 v32_land_reduction(j,land32) 			Forestry land reduction compared to previous timestep (mio. ha)
 vm_cdr_aff(j,co2_forestry) Total CDR from afforestation (new and existing areas) between t+1 and t=s32_planing_horizon CO2-C (mio. t)
;

equations
 q32_cost_fore_ac(i)                      Total forestry costs constraint (mio. USD)
 q32_land(j)                              Land constraint (mio. ha)
 q32_cdr_aff(j,co2_forestry)  Calculation of CDR from afforestation in terms of CO2-C (mio. t)
 q32_carbon(j,c_pools)                    Forestry carbon stock calculation C (mio. t)
 q32_land_diff                            Aggregated difference in forestry land compared to previous timestep (mio. ha)
 q32_land_expansion(j,land32)		   	  Forestry land expansion
 q32_land_reduction(j,land32)		   	  Forestry land reduction
 q32_max_aff					          Maximum total global afforestation (mio. ha)
 q32_aff_pol(j)					          Afforestation policy constraint (mio. ha)
;


*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_cost_fore(t,i,type)               Afforestation costs (mio. USD)
 ov32_land(t,j,land32,type)           Forestry land pools (mio. ha)
 ov_landdiff_forestry(t,type)         Aggregated difference in forestry land compared to previous timestep (mio. ha)
 ov32_land_expansion(t,j,land32,type) Forestry land expansion compared to previous timestep (mio. ha)
 ov32_land_reduction(t,j,land32,type) Forestry land reduction compared to previous timestep (mio. ha)
 ov_cdr_aff(t,j,co2_forestry,type)    Total CDR from afforestation (new and existing areas) between t+1 and t=s32_planing_horizon CO2-C (mio. t)
 oq32_cost_fore_ac(t,i,type)          Total forestry costs constraint (mio. USD)
 oq32_land(t,j,type)                  Land constraint (mio. ha)
 oq32_cdr_aff(t,j,co2_forestry,type)  Calculation of CDR from afforestation in terms of CO2-C (mio. t)
 oq32_carbon(t,j,c_pools,type)        Forestry carbon stock calculation C (mio. t)
 oq32_land_diff(t,type)               Aggregated difference in forestry land compared to previous timestep (mio. ha)
 oq32_land_expansion(t,j,land32,type) Forestry land expansion
 oq32_land_reduction(t,j,land32,type) Forestry land reduction
 oq32_max_aff(t,type)                 Maximum total global afforestation (mio. ha)
 oq32_aff_pol(t,j,type)               Afforestation policy constraint (mio. ha)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################
