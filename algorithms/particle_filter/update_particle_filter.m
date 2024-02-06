function [particles] = update_particle_filter(read_only_vars, public_vars)
%UPDATE_PARTICLE_FILTER Summary of this function goes here

particles = public_vars.particles;

% I. Prediction
for i=1:size(particles, 1)
    particles(i,:) = predict_pose(particles(i,:), public_vars.motion_vector, read_only_vars);
end

% II. Correction
measurements = zeros(size(particles,1), length(read_only_vars.sensors));
for i=1:size(particles, 1)
    measurements(i,:) = compute_measurement(read_only_vars.map, particles(i,:), read_only_vars.sensors);
end
weights = weight_particles(measurements, read_only_vars.measurement_distances);

% III. Resampling
particles = resample_particles(particles, weights);


end

