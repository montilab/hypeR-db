import pandas as pd
import requests

def download():
    # Sourcing data from Enrichr (https://amp.pharm.mssm.edu/Enrichr/#stats)
    df = pd.read_table("../raw/genesets.txt", sep=" ", usecols=range(4))
    genesets = list(df['Geneset_Library'])

    # Download link
    url = "https://amp.pharm.mssm.edu/Enrichr/geneSetLibrary?mode=text&libraryName={0}"
    for gset in genesets:
        try:
            response = requests.get(url.format(gset))
            content = response.content
            with open("../raw/genesets/{0}.txt".format(gset), "wb") as outfile:
                outfile.write(content)
        except Exception as e:
            print(gset)
            print(e)