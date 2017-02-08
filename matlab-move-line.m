% Move a source code line up or down by one position in the MATLAB's editor.
% This script may be used as a MATLAB shortcut. 
%
% This program is distributed under the BSD 2-clause license, 
% see LICENSE file for the full text.
%
% Copyright © 2017 Martino Pilia <martino.pilia@gmail.com>

% direction: +1 to move down, -1 to move up
d = +1;

% get text and cursor position
currentEditor = matlab.desktop.editor.getActive;
selection = currentEditor.Selection;
lines = splitlines(currentEditor.Text);
line = selection(1);

% boundary check
if line + d < 1 || line + d > length(lines)
    return;
end

% swap lines
tmp = lines(line);
lines(line) = lines(line + d);
lines(line + d) = tmp;

% update text and cursor position in the editor
currentEditor.Text = char(strjoin(lines, '\n'));
selection = selection + [d 0 d 0];
currentEditor.Selection = selection;
clear currentEditor selection;

