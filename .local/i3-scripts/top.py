import json
import argparse
import sys

parser = argparse.ArgumentParser()
parser.add_argument("tree_string", type=str, help="i3 Tree Output")
parser.add_argument("sel_display", type=str, help="Current Display")
parser.add_argument("sel_workspace_name", type=str, help="Current Workspace")
args = parser.parse_args()

tree_json = json.loads(args.tree_string)
displays = tree_json ["nodes"]

## Functions
def MaxDepth(nodes):
    depth = 1
    
    for x in nodes:
        if "nodes" in x:
            tmp = MaxDepth(x["nodes"]) + 1
        else:
            tmp = 1
        depth = max (depth, tmp)
    return depth
## End of Functions

## Variables
sel_disp_node=[]
sel_disp_node_workspaces=[]
sel_workspace=[]
## End of Variables

for node1 in displays:
    if node1['name'] == args.sel_display:
        sel_disp_node = node1["nodes"]

for node2 in sel_disp_node:
    if node2['name'] == "content":
        sel_disp_node_workspaces = node2["nodes"]

for node3 in sel_disp_node_workspaces:
    if node3['name'] == args.sel_workspace_name:
        sel_workspace = node3["nodes"]

print (MaxDepth (sel_workspace))

