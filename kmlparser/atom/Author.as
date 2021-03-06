/*
        Copyright (c) 2008, Adobe Systems Incorporated
        All rights reserved.

        Redistribution and use in source and binary forms, with or without 
        modification, are permitted provided that the following conditions are
        met:

    * Redistributions of source code must retain the above copyright notice, 
        this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
                notice, this list of conditions and the following disclaimer in the 
        documentation and/or other materials provided with the distribution.
    * Neither the name of Adobe Systems Incorporated nor the names of its 
        contributors may be used to endorse or promote products derived from 
        this software without specific prior written permission.

        THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
        IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
        THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
        PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
        CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
        EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
        PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
        PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
        LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
        NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
        SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.esri.solutions.flexviewer.widgets.kmlparser.atom
{
	import com.esri.solutions.flexviewer.widgets.kmlparser.XmlElement;
	import com.esri.solutions.flexviewer.widgets.kmlparser.XmlParser;
	import com.esri.solutions.flexviewer.widgets.kmlparser.ParsingTools;
	import com.esri.solutions.flexviewer.widgets.kmlparser.Namespaces;
	
	public class Author extends XmlElement {
	
	private var atom:Namespace = Namespaces.ATOM_NS;

	private var _name:String;
	private var _email:String;
	private var _uri:String;
	
	/**
	*	Class that represents an author element within an Atom feed.
	* 
	* 	@langversion ActionScript 3.0
	*	@playerversion Flash 8.5
	*	@tiptext
	* 
	* 	@see http://www.atomenabled.org/developers/syndication/atom-format-spec.php#rfc.section.4.2.1
	*/		
	
	public function Author(x:XMLList) {
		super(x);
		this._name = ParsingTools.nullCheck(this.x.atom::author.@["name"]);
		this._email = ParsingTools.nullCheck(this.x.atom::author.email);
		this._uri = ParsingTools.nullCheck(this.x.atom::author.uri);
	}
	
	public function get name():String {
		return this._name;
	}
	
	public function get email():String {
		return this._email;
	}
	
	public function get uri():String {
		return this._uri;
	}
    }
}