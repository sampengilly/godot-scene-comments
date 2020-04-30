extends EditorSpatialGizmoPlugin

const SpatialComment = preload("SpatialComment.gd")

var materials = {}

func _init():
	materials[SpatialComment.Type.COMMENT] = _load_material(preload("icons/comment.svg"), Color(0.7, 0.7, 0.7, 0.6))
	materials[SpatialComment.Type.ISSUE] = _load_material(preload("icons/issue.svg"), Color(1.0, 1.0, 0.7, 0.6))
	materials[SpatialComment.Type.TODO] = _load_material(preload("icons/todo.svg"), Color(0.7, 0.7, 1.0, 0.6))


func _load_material(tex: Texture, color: Color) -> SpatialMaterial:
	var material = SpatialMaterial.new()
	material.set_albedo(color)
	material.set_flag(SpatialMaterial.FLAG_UNSHADED, true)
	material.set_flag(SpatialMaterial.FLAG_ALBEDO_FROM_VERTEX_COLOR, true)
	material.set_flag(SpatialMaterial.FLAG_SRGB_VERTEX_COLOR, true)
	material.set_cull_mode(SpatialMaterial.CULL_DISABLED)
	material.set_depth_draw_mode(SpatialMaterial.DEPTH_DRAW_DISABLED)
	material.set_feature(SpatialMaterial.FEATURE_TRANSPARENT, true)
	material.set_texture(SpatialMaterial.TEXTURE_ALBEDO, tex)
	material.set_flag(SpatialMaterial.FLAG_FIXED_SIZE, true)
	material.set_billboard_mode(SpatialMaterial.BILLBOARD_ENABLED)
	material.set_render_priority(SpatialMaterial.RENDER_PRIORITY_MIN)
	return material


func get_name():
	return "Comments"


func has_gizmo(spatial):
	return spatial is SpatialComment


func redraw(gizmo):
	gizmo.clear()
	var spatial: SpatialComment = gizmo.get_spatial_node()
	gizmo.add_unscaled_billboard(materials[spatial.type], 0.05)
