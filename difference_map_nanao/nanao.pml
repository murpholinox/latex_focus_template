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
    -0.755389750,    0.477396697,    0.448856562,\
     0.654637158,    0.579959989,    0.484864801,\
    -0.028846432,    0.660100043,   -0.750620365,\
     0.000007923,   -0.000178033,  -22.906740189,\
     6.051351070,   10.364200592,   25.959999084,\
    20.018686295,   25.801801682,   20.000000000 )
symexp sym, 2blx, (2blx), 5
cmd.disable('sym000000-1')
cmd.disable('sym030000-1')
cmd.disable('sym070000-1')
cmd.disable('sym01000000')
cmd.disable('sym03000000')
cmd.disable('sym04000000')
cmd.disable('sym00000001')
cmd.disable('sym01000001')
cmd.disable('sym05000001')
cmd.disable('sym04010000')
cmd.color_deep("lightblue", 'sym05000000', 0)
util.cnc("sym05000000",_self=cmd)
set grid_slot, 1, sym05000000
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
