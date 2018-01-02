## Copyright (C) 2017 Srinivas Venkatraman
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} costFunction__reg_1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Srinivas Venkatraman <vxsrini@vxsrini-desktop>
## Created: 2017-12-24

function [jVal, gradient] =  costFunction__reg_1(theta1, X, y, lambda)

	h = (1 ./ (1 + exp(-1 * X * theta1)));  
  reg = (lambda / (2 * rows(X))) * (sum(theta1(2:rows(theta1)) .^ 2));
	jVal = (-1/rows(X)) * ((y' * log(h)) + ((1-y)' * log(1 - h)));
  jVal = jVal + reg;
	gradient = zeros(rows(X), 1);
	gradient = (1/rows(X)) .* (X' * (h - y));
  gradient = gradient + (lambda / rows(X)) .* [0;theta1(2:rows(theta1))]

endfunction
