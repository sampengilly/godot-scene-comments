tool
extends EditorPlugin

const SpatialCommentGizmoPlugin = preload("SpatialCommentGizmoPlugin.gd")

var spatial_comment_gizmo_plugin = SpatialCommentGizmoPlugin.new()

func _enter_tree():
	add_spatial_gizmo_plugin(spatial_comment_gizmo_plugin)
	add_custom_type(\
		"Comment", \
		"Spatial", \
		preload("SpatialComment.gd"), \
		preload("icons/spatial-comment.svg"))


func _exit_tree():
	remove_custom_type("SpatialComment")
	remove_spatial_gizmo_plugin(spatial_comment_gizmo_plugin)
