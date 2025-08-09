"use client";

import { useFormStatus } from "react-dom";
import { ReactElement, type ComponentProps } from "react";

type Props = ComponentProps<"button"> & {
  pendingText?: string;
  icon? :ReactElement;
};

export function SubmitButton({ children, pendingText,icon, ...props }: Props) {
  const { pending, action } = useFormStatus();

  const isPending = pending && action === props.formAction;

  return (
    <button {...props} type="submit" aria-disabled={pending}>
      {" "}
      {isPending ?<span className="flex flex-col items-center justify-center"> {icon} {pendingText}</span> : children}
    </button>
  );
}
