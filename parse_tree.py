import sys,re,json,os.path

infile = open(sys.argv[1])
pattern = re.compile("^#")

g_communities = {}
g_nodes = {}

for line in infile:
    if pattern.match(line):
        continue
    s = line.split(' ')
    c = tuple([int(x) for x in s[0].split(':')[:-1]])
    flow = float(s[1])
    n = int(s[3])
    if not c in g_communities:
        g_communities[c] = []
    g_communities[c].append(n)
    if not n in g_nodes:
        g_nodes[n] = []
    g_nodes[n].append(c)

#print(communities, nodes)

min_depth = min([len(coms) for coms in g_communities.keys()])

def merge_communities(communities, d):
    ret = {}
    for coms,nodes in communities.items():
        key = coms[:d]
        if not key in ret:
            ret[key] = []
        ret[key] += nodes
    for k in ret.keys():
        ret[k] = set(ret[k]) # make it unique
    return ret

def merge_nodes(nodes, d):
    ret = {}
    for n,coms in nodes.items():
        ret[n] = set([c[:d] for c in coms])
    return ret

def calculate_avg_num_coms_per_node(nodes):
    num_coms = [ len(coms) for n,coms in nodes.items() ]
    return sum(num_coms) / len(num_coms)

def calculate_avg_com_size(communities):
    com_sizes = [len(ns) for c,ns in communities.items() ]
    return sum(com_sizes) / len(com_sizes)

results = {}
for d in range(min_depth):
    coms = merge_communities(g_communities, d+1)
    nodes = merge_nodes(g_nodes, d+1)
    results[d] = {"AvgNumComsPerNode": calculate_avg_num_coms_per_node(nodes), "AvgComSize": calculate_avg_com_size(coms) }
results["lowest"] = {"AvgNumComsPerNode": calculate_avg_num_coms_per_node(g_nodes), "AvgComSize": calculate_avg_com_size(g_communities) }

print(json.dumps(results))

