tool
extends Spatial

enum Type {
	COMMENT,
	ISSUE,
	TODO
}

export (Type) var type = Type.COMMENT setget _update_type
export (String, MULTILINE) var remarks


func _enter_tree():
	set_process(false)
	set_process_input(false)


func _update_type(value):
	type = value
	update_gizmo()
