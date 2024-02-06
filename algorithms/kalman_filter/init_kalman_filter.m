function [public_vars] = init_kalman_filter(read_only_vars, public_vars)
%INIT_KALMAN_FILTER Summary of this function goes here

public_vars.kf.C = [];
public_vars.kf.R = [];
public_vars.kf.Q = [];

public_vars.mu = [];
public_vars.sigma = [];

end

