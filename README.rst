What is this?
=============

These are syntax highlighting files that I use to edit CollabNet Teamforge wiki
pages in Vi in Vim. 

How to install?
===============

The easy way
------------

Use pathogen_ plugin and ``git clone`` this repo in your *bundle* directory.

.. _pathogen: https://github.com/tpope/vim-pathogen

The (not so) hard way
---------------------

Update *ftdetect* and *syntax* directories in your .vim with the file you can find here.

How to use?
===========

Simply edit a file with *.ctf* extension. You can also apply the highlighting to any file with command:: 

    :set filetype=teamforge

Limitation
==========

This is a pre-alpha release that I wrote before having dinner... Therefore
please do not expect hi-quality piece of software. Lots of syntax elements still have to be integrated.
