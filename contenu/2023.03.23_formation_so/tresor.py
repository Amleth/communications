from pprint import pprint
import requests

BASE = "http://bases-iremus.huma-num.fr/directus-tresor"

r = requests.post("http://bases-iremus.huma-num.fr/directus-catalogue" + "/auth/login", json={"email": "thomas.bottini@cnrs.fr", "password": "14a32e3e-bc5a-4c7d-83f6-6aea62baaab2"})
access_token = r.json()["data"]["access_token"]
refresh_token = r.json()["data"]["refresh_token"]

data = requests.get(f"{BASE}/items/commandes?limit=-1&access_token={access_token}").json()["data"]
print(set(sorted(([c["oc"] for c in data]))))
print(set(sorted(([c["ed"] for c in data]))))

EXCLUDED_ED = [
    "POLIFONIA",
    "GDRI",
    "PÉNICHE OP",
    "POMC",
    "PMR"
]
EXCLUDED_COMMANDES = ["5575"]

# data = [x for x in data if x["ed"] not in EXCLUDED_ED and x["id"] not in EXCLUDED_COMMANDES]
data = [x for x in data if x["activite"] == "a0d7d015-60c5-476a-b92c-028722143910"]
print(sum([x["montant"] for x in data]))
