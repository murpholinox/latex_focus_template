load 2blx.pdb
load 2bly.pdb
hide all
show sticks, 2blx and resi 1-129
show sticks, 2bly and resi 1-129
show spheres, resname HOH
set sphere_scale,0.25
load diff.map
load 2blx_phases_2mFo-DFc.ccp4, 2blx_azul
load 2bly_phases_2mFo-DFc.ccp4, 2bly_azul
load 2blx_phases_mFo-DFc.ccp4, 2blx_dif
load 2bly_phases_mFo-DFc.ccp4, 2bly_dif
select bef, 2blx
select aft, 2bly
isomesh 2blx_2fo-fc, 2blx_azul, 1.0, bef, carve=6.0
isomesh 2bly_2fo-fc, 2bly_azul, 1.0, aft, carve=6.0
isomesh 2blx_fo-fc_neg, 2blx_dif, -3.5, bef, carve=6.0
isomesh 2blx_fo-fc_pos, 2blx_dif, 3.5, bef, carve=6.0
isomesh 2bly_fo-fc_pos, 2bly_dif, 3.5, aft, carve=6.0
isomesh 2bly_fo-fc_neg, 2bly_dif, -3.5, aft, carve=6.0
isomesh c2-c1_neg, diff, -3.5, bef, carve=6.0
isomesh c2-c1_pos, diff, 3.5, bef, carve=6.0
color tv_blue, 2blx_2fo-fc
color gray, 2bly_2fo-fc
color tv_green, 2blx_fo-fc_pos
color tv_red, 2blx_fo-fc_neg
color cyan, 2bly_fo-fc_pos
color magenta, 2bly_fo-fc_neg
color cyan, c2-c1_pos
color magenta, c2-c1_neg
set grid_mode, 1
set grid_slot, 1, 2blx
set grid_slot, 1, 2blx_*
set grid_slot, 2, 2bly
set grid_slot, 2, 2bly_*
set grid_slot, 1, c2-c1_* 
color white, (name C*)
set ray_trace_mode, 1
set antialias, 2
set ray_trace_color, black 
set bg_gradient
set bg_rgb_top, lightblue
set bg_rgb_bottom, white 
set mesh_width, 1.5
set ray_opaque_background, on
set ray_shadow, off
set hash_max, 300
cmd.disable('2bly_2fo-fc')
cmd.disable('2bly_fo-fc_pos')
cmd.disable('2bly_fo-fc_neg')
cmd.disable('2bly')
cmd.disable('c2-c1_pos')
cmd.disable('c2-c1_neg')
set orthoscopic, 1
set internal_gui, 0
full_screen
set_view (\
_    -0.503582299,    0.244371891,    0.828665793,\
_     0.848163903,    0.322341412,    0.420373470,\
_    -0.164385796,    0.914537132,   -0.369592786,\
_     0.000000000,    0.000000000,  -40.728195190,\
_     5.619497299,   12.458251953,   26.723999023,\
_    38.644012451,   42.812377930,   20.000000000 )
png before.png, dpi=300, width=20cm, ray=1
cmd.enable('2bly_2fo-fc')
cmd.enable('2bly_fo-fc_pos')
cmd.enable('2bly_fo-fc_neg')
cmd.enable('2bly')
cmd.disable('2blx_2fo-fc')
cmd.disable('2blx_fo-fc_pos')
cmd.disable('2blx_fo-fc_neg')
cmd.disable('2blx')
set bg_rgb_top, firebrick 
set bg_rgb_bottom,  brightorange
png after.png, dpi=300, width=20cm, ray=1
cmd.disable('2bly_2fo-fc')
cmd.disable('2bly_fo-fc_pos')
cmd.disable('2bly_fo-fc_neg')
cmd.disable('2bly')
set bg_gradient, 0
cmd.set('opaque_background',1,'',0)
cmd.set('bg_rgb',0,'',0)
cmd.enable('c2-c1_pos')
cmd.enable('c2-c1_neg')
cmd.enable('2blx')
png diff.png, dpi=300, width=20cm, ray=1
