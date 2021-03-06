function poses_3D = poses_final(cam1_folder, cam2_folder, calib_results);

%% This function calculates the 3D positions of joints.

% Inputs:
%     cam1_folder: foldername with json files from camera-1
%     cam2_folder: foldername with json files from camera-2
%     calib_results: Stereo calibration results from MATLAB camera
%     calibration toolbox
%
% Outputs:
%    A cell with 3D coordinates of all joint positions.
%     
% Written by: Ahmet Arac, Department of Neurology, UCLA, Los Angeles, CA

[cam1_2D.head, cam1_2D.Reye, cam1_2D.Rear, cam1_2D.Leye, cam1_2D.Lear, cam1_2D.chest,...
    cam1_2D.Rshoulder, cam1_2D.Relbow, cam1_2D.Rwrist,...
    cam1_2D.Lshoulder, cam1_2D.Lelbow, cam1_2D.Lwrist, cam1_2D.midhip, cam1_2D.Rhip,...
    cam1_2D.Lhip, cam1_2D.Rknee, cam1_2D.Lknee, cam1_2D.RH_wrist, cam1_2D.RH_thumb1,...
    cam1_2D.RH_thumb2, cam1_2D.RH_thumb3, cam1_2D.RH_index1, cam1_2D.RH_index2,...
    cam1_2D.RH_index3, cam1_2D.RH_index4, cam1_2D.RH_mid1, cam1_2D.RH_mid2, cam1_2D.RH_mid3,...
    cam1_2D.RH_mid4, cam1_2D.RH_ring1, cam1_2D.RH_ring2, cam1_2D.RH_ring3, cam1_2D.RH_ring4,...
    cam1_2D.RH_pinky1, cam1_2D.RH_pinky2, cam1_2D.RH_pinky3, cam1_2D.RH_pinky4, cam1_2D.LH_wrist,...
    cam1_2D.LH_thumb1, cam1_2D.LH_thumb2, cam1_2D.LH_thumb3, cam1_2D.LH_index1, cam1_2D.LH_index2,...
    cam1_2D.LH_index3, cam1_2D.LH_index4, cam1_2D.LH_mid1, cam1_2D.LH_mid2, cam1_2D.LH_mid3,...
    cam1_2D.LH_mid4, cam1_2D.LH_ring1, cam1_2D.LH_ring2, cam1_2D.LH_ring3, cam1_2D.LH_ring4,...
    cam1_2D.LH_pinky1, cam1_2D.LH_pinky2, cam1_2D.LH_pinky3, cam1_2D.LH_pinky4]=pose2D(cam1_folder);

[cam2_2D.head, cam2_2D.Reye, cam2_2D.Rear, cam2_2D.Leye, cam2_2D.Lear, cam2_2D.chest,...
    cam2_2D.Rshoulder, cam2_2D.Relbow, cam2_2D.Rwrist,...
    cam2_2D.Lshoulder, cam2_2D.Lelbow, cam2_2D.Lwrist, cam2_2D.midhip, cam2_2D.Rhip,...
    cam2_2D.Lhip, cam2_2D.Rknee, cam2_2D.Lknee, cam2_2D.RH_wrist, cam2_2D.RH_thumb1,...
    cam2_2D.RH_thumb2, cam2_2D.RH_thumb3, cam2_2D.RH_index1, cam2_2D.RH_index2,...
    cam2_2D.RH_index3, cam2_2D.RH_index4, cam2_2D.RH_mid1, cam2_2D.RH_mid2, cam2_2D.RH_mid3,...
    cam2_2D.RH_mid4, cam2_2D.RH_ring1, cam2_2D.RH_ring2, cam2_2D.RH_ring3, cam2_2D.RH_ring4,...
    cam2_2D.RH_pinky1, cam2_2D.RH_pinky2, cam2_2D.RH_pinky3, cam2_2D.RH_pinky4, cam2_2D.LH_wrist,...
    cam2_2D.LH_thumb1, cam2_2D.LH_thumb2, cam2_2D.LH_thumb3, cam2_2D.LH_index1, cam2_2D.LH_index2,...
    cam2_2D.LH_index3, cam2_2D.LH_index4, cam2_2D.LH_mid1, cam2_2D.LH_mid2, cam2_2D.LH_mid3,...
    cam2_2D.LH_mid4, cam2_2D.LH_ring1, cam2_2D.LH_ring2, cam2_2D.LH_ring3, cam2_2D.LH_ring4,...
    cam2_2D.LH_pinky1, cam2_2D.LH_pinky2, cam2_2D.LH_pinky3, cam2_2D.LH_pinky4]=pose2D(cam2_folder);

poses_3D = struct('head', [], 'Reye',[], 'Rear', [], 'Leye', [], 'Lear', [],...
    'chest', [], 'Rshoulder', [], 'Relbow', [], 'Rwrist', [], 'Lshoulder', [],...
    'Lelbow', [], 'Lwrist', [], 'midhip', [], 'Rhip', [], 'Lhip', [], 'Rknee', [], 'Lknee', [],...
    'RH_wrist', [], 'RH_thumb1', [], 'RH_thumb2', [], 'RH_thumb3', [], 'RH_index1', [],...
    'RH_index2', [], 'RH_index3', [], 'RH_index4', [], 'RH_mid1', [], 'RH_mid2', [], 'RH_mid3', [],...
    'RH_mid4', [], 'RH_ring1', [], 'RH_ring2', [], 'RH_ring3', [], 'RH_ring4', [], 'RH_pinky1', [],...
    'RH_pinky2', [], 'RH_pinky3', [], 'RH_pinky4', [], 'LH_wrist', [], 'LH_thumb1', [],...
    'LH_thumb2', [], 'LH_thumb3', [], 'LH_index1', [], 'LH_index2', [], 'LH_index3', [],...
    'LH_index4', [], 'LH_mid1', [], 'LH_mid2', [], 'LH_mid3', [], 'LH_mid4', [], 'LH_ring1', [],...
    'LH_ring2', [], 'LH_ring3', [], 'LH_ring4', [], 'LH_pinky1', [], 'LH_pinky2', [], 'LH_pinky3', [],...
    'LH_pinky4', []);

names = fieldnames(poses_3D);

load(calib_results);

for i=1:length(names)
    A1 = getfield(cam1_2D,names{i})';
    A2 = getfield(cam2_2D,names{i})';
    
    [XL,XR] = stereo_triangulation(A1,A2,om,T,fc_left,cc_left,kc_left,alpha_c_left,fc_right,...
        cc_right,kc_right,alpha_c_right);
    
    % smoothen the XL
    x= XL(1,:)';
    y= XL(3,:)';
    z= XL(2,:)';
    u = cell2mat(smoothn({x,y,-z},'robust'));

    % assign the 3D position to the final poses_3D structure with the
    % correct fields.
    poses_3D = setfield(poses_3D,names{i},u);
    
end



end