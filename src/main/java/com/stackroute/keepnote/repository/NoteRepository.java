package com.stackroute.keepnote.repository;

import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;


import com.stackroute.keepnote.model.Note;

/*
 * This class contains the code for data storage interactions and methods 
 * of this class will be used by other parts of the applications such
 * as Controllers and Test Cases
 * */

public class NoteRepository {

	/* Declare a variable called "list" to store all the notes. */
	private List<Note> list;

	public NoteRepository() {

		/* Initialize the variable using proper data type */
		list=new ArrayList<Note>();
	}

	/* This method should return all the notes in the list */

	public List<Note> getList() {
		return null;
	}

	/* This method should set the list variable with new list of notes */

	public void setList(List<Note> list) {

	}

	/*
	 * This method should Note object as argument and add the new note object into
	 * list
	 */

	public boolean addNote(Note note) {
		return list.add(note);
	}

	/* This method should deleted a specified note from the list */

	public boolean deleteNote(int noteId) {
		/* Use list iterator to find matching note id and remove it from the list */
		Note note=getNoteByNoteId(noteId);
		if(note!=null) {
			list.remove(note);
			return true;
		}
		return false;		
	}

	/* This method should return the list of notes */

	public List<Note> getAllNotes() {
		return list;
	}

	/*
	 * This method should check if the matching note id present in the list or not.
	 * Return true if note id exists in the list or return false if note id does not
	 * exists in the list
	 */
	public boolean updateNote(Note note1) {
		Note note=getNoteByNoteId(note1.getNoteId());
		if(note!=null) {
			note.setNoteTitle(note1.getNoteTitle());
			note.setNoteContent(note1.getNoteContent());
			note.setNoteStatus(note1.getNoteStatus());
			return true;
		}
		return false;
	}
	
	//reading notes using note id
	public Note getNoteByNoteId(int noteId) {
		Note user=null;
		Iterator<Note> itr=list.iterator();
		while(itr.hasNext()) {
			user=itr.next();
			if(noteId==user.getNoteId()){
				return user;
			}
		}
		return null;
	}

	public boolean exists(int noteId) {
		Note user=null;
		Iterator<Note> itr=list.iterator();
		while(itr.hasNext()) {
			user=itr.next();
			if(noteId==user.getNoteId()){
				return true;
			}
		}
		return false;
	}
}