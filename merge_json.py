import sys,json

d = {}

for arg in sys.argv[1::]:
    j = json.load( open(arg) )
    d.update(j)

print( json.dumps(d, indent=2, sort_keys=True) )

