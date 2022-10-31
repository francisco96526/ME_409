import matplotlib.pyplot as plt
from pathlib import Path

def plot_lines(X,Y,title="",labels=[],xlabel=r"$x$",ylabel=r"$y$",linewidth=2,savefig=False,filename="plot_custom"):
    """
    input: X, Y, title, labels, axis labels, linewidth, savefig, filename
    This function takes all the necessary inputs to plot a n lines ( 0 < n ).
    The plot is saved if savefig equals True
    output: None
    """
    plt.figure()

    for i in range(X.shape[1]):
        plt.plot(X[:,i],Y[:,i],linewidth=2,label=labels[i])
    
    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.legend()

    if savefig:
        filePath = Path("results",f'{filename}.png')
        plt.savefig(filePath)
    
    plt.clf()

    return None