field(business_information_system) :-
    confirm_specific_interest(business, 3),
    confirm_specific_interest(analyzing_data, 3). 

field(software_engineering) :-
    confirm_specific_interest(programming, 3), 
    confirm_specific_interest(ood, 3).  

field(high_performance_computing) :-
    confirm_specific_interest(linux_os, 3), %Threshold for business must be >= 3 to advice BIS
    confirm_specific_interest(parallel_computing, 3).%Threshold for analyzing data must be >= 3 to advice BIS

    
field(knowledge_engineering) :-
    confirm_specific_interest(expert_system, 3),
    confirm_specific_interest(algorithms, 3). %input neural network
  
field(computer_networking) :-
    confirm_specific_interest(telecom_network, 3),
    confirm_specific_interest(data_trans, 3).

field(embedded_systems) :-
    confirm_specific_interest(sensors_electronics, 3),
    confirm_specific_interest(digital_signal, 3).

field_CT_T3() :-
    confirm_same_interestLevel_CT(telecom_network,
                                  data_trans,
                                  sensors_electronics,
                                  digital_signal,
                                  3).
field_CT_T4() :-
    confirm_same_interestLevel_CT(telecom_network,
                                  data_trans,
                                  sensors_electronics,
                                  digital_signal,
                                  4).  
field_CS_T4() :-
    confirm_same_interestLevel_CS(business,
                                  analyzing_data,
                                  programming,
                                  ood,
                                  linux_os,
                                  parallel_computing,
                                  expert_system,
                                  algorithms,
                                  4).
field_CS_T3() :-
    confirm_same_interestLevel_CS(business,
                                  analyzing_data,
                                  programming,
                                  ood,
                                  linux_os,
                                  parallel_computing,
                                  expert_system,
                                  algorithms,
                                  3).



                

% Advices on courses one should take
should_take(X) :-
    setof(X, can_take(X), Courses),
    member(X, Courses).

% Define conditions necessary to take given majors
can_take(business_information_system) :-
    bis_any_meets_threshold(b_fis, dbms, sre, 2.67), %max
    field(business_information_system).

can_take(knowledge_engineering) :-
    ke_any_meets_threshold(dsa, em, ai, 2.67), %max
    field(knowledge_engineering). 

can_take(software_engineering) :-
    se_any_meets_threshold(b_fis, dsa, dbms, sre, 2.67), %max
    field(software_engineering). 

can_take(high_performance_computing) :-
    hpc_any_meets_threshold(osf, dsa, la_ns, co, nd_e, 2.67), %max
    field(high_performance_computing). 


can_take(computer_networking) :-
    cn_any_meets_threshold(osf, an, nd_e, la_ns, 2.67), %max
    field(computer_networking). 

can_take(embedded_systems) :-
    es_any_meets_threshold(ai, em, ec_s, 2.67), %max
    field(embedded_systems). 



        



   